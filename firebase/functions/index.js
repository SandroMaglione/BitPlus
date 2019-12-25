// The Cloud Functions for Firebase SDK to create Cloud Functions and setup triggers.
const functions = require('firebase-functions');

// The Firebase Admin SDK to access the Firebase Realtime Database.
const admin = require('firebase-admin');
admin.initializeApp();

const db = admin.firestore();
const auth = admin.auth();

// TODO: Add order to habits
exports.getTodayHabitList = functions.https.onRequest(async (req, res) => {
    const { userID } = req.body;
    const todayDate = new Date();
    const todayID = `${todayDate.getDate()}${todayDate.getMonth() + 1}${todayDate.getFullYear()}`;
    let checks = [];

    const habits = await db.collection('user')
        .doc(userID)
        .collection("habit")
        .get();

    for (let i = 0; i < habits.size; ++i) {
        const habitData = habits.docs[i].data();
        const docHabitID = habits.docs[i].id;
        const dailyCheck = habitData.check;
        const isChecked = dailyCheck != undefined && Array.isArray(dailyCheck) && dailyCheck.includes(todayID);

        const respObj = {
            'habitID': docHabitID,
            'checked': isChecked,
            'isPositive': habitData.isPositive,
            'color': habitData.color,
            'value': habitData.value,
            'areas': habitData.areas,
            'name': habitData.name
        };

        checks.push(respObj);
    }

    res.status(200).send(JSON.stringify(checks));
});

exports.createHabit = functions.https.onRequest(async (req, res) => {
    const { uid, color, name, isPositive, value, areas } = req.body;

    const newHabit = await db.collection('user')
        .doc(uid)
        .collection('habit')
        .add({
            color: color,
            name: name,
            isPositive: isPositive,
            value: value,
            areas: areas,
            dateCreated: admin.firestore.Timestamp.fromDate(new Date())
        });
        
    console.log('createHabit: Done', newHabit.id);
    res.status(200).send(newHabit.id);
});

exports.updateHabit = functions.https.onRequest(async (req, res) => {
    const { uid, habitID, color, name, isPositive, value, areas } = req.body;

    await db.collection('user')
        .doc(uid)
        .collection('habit')
        .doc(habitID)
        .update({
            color: color,
            name: name,
            isPositive: isPositive,
            value: value,
            areas: areas
        });

    console.log('updateHabit: Done', habitID);
    res.status(200).send(habitID);
});

exports.uncheckDailyHabit = functions.https.onRequest(async (req, res) => {
    const { userID, habitID } = req.body;
    const todayID = generateTodayId();

    await db.collection('user')
        .doc(userID)
        .collection('habit')
        .doc(habitID)
        .update({
            check: admin.firestore.FieldValue.arrayRemove(todayID)
        });

    console.log(todayID);
    console.log('Done');
    res.status(200).send(todayID);
});

exports.checkDailyHabit = functions.https.onRequest(async (req, res) => {
    const { userID, habitID } = req.body;
    const todayID = generateTodayId();

    await db.collection('user')
        .doc(userID)
        .collection('habit')
        .doc(habitID)
        .update({
            check: admin.firestore.FieldValue.arrayUnion(todayID)
        });

    console.log(todayID);
    console.log('Done');
    res.status(200).send(todayID);
});

exports.storeUserProfile = functions.https.onRequest(async (req, res) => {
    const { uid, email, areas } = req.body;
    const objUser = {
        email: email,
        areas: areas,
        level: 1,
        experience: 0,
        dateCreated: admin.firestore.Timestamp.fromDate(new Date())
    };

    await db.collection('user').doc(uid).create(objUser);
    res.status(200).send(uid);
});

const generateTodayId = () => {
    const todayDate = new Date();
    return `${todayDate.getDate()}${todayDate.getMonth() + 1}${todayDate.getFullYear()}`;
}