// The Cloud Functions for Firebase SDK to create Cloud Functions and setup triggers.
const functions = require('firebase-functions');

// The Firebase Admin SDK to access the Firebase Realtime Database.
const admin = require('firebase-admin');
admin.initializeApp();

const db = admin.firestore();
const auth = admin.auth();

// TODO: Add order to habits
exports.getTodayHabitList = functions.https.onRequest(async (req, res) => {
    // Note: dateRange +1 because it counts today too (not in the streak)
    const { uid, dateRange } = req.body;

    // Generate today id string e.g. 12 Dec 2019 => "12122019"
    const todayID = generateTodayId();

    // Initialize list of habit to return
    let habitCheck = [];

    // Fetch all habits of user with 'uid'
    const habits = await db.collection('user')
        .doc(uid)
        .collection("habit")
        .get();

    for (let i = 0; i < habits.size; ++i) {
        // Export habit id and data
        const docHabitID = habits.docs[i].id;
        const habitData = habits.docs[i].data();

        // Compute true/false today check
        const dailyCheck = habitData.check;
        const isChecked = dailyCheck != undefined && Array.isArray(dailyCheck) && dailyCheck.includes(todayID);

        // Compute list of true/false checked last 'dateRange' days
        let endDate = new Date();
        endDate.setDate(endDate.getDate() - dateRange);
        let dayChecks = [];
        let countChecks = 0;
        for (let d = new Date(); d > endDate; d.setDate(d.getDate() - 1)) {
            const dString = dateToString(d);
            const dayCheckPush = {
                day: new Date(d.getTime()),
            }

            if (dailyCheck != undefined && dailyCheck.includes(dString)) {
                ++countChecks;
                dayChecks.push({
                    ...dayCheckPush,
                    isChecked: true
                });
            } else {
                dayChecks.push({
                    ...dayCheckPush,
                    isChecked: false
                });
            }
        }

        // Compute current consecutive days check streak
        let checkStreak = isChecked ? 1 : 0;
        let checkIndex = 0;
        while (dailyCheck != undefined && dayChecks[checkIndex + 1].isChecked) {
            ++checkIndex;
            ++checkStreak;
        }

        habitCheck.push({
            'habitID': docHabitID,
            'checked': isChecked,
            'color': habitData.color,
            'areas': habitData.areas,
            'name': habitData.name,
            'history': dayChecks,
            'streak': checkStreak,
            'countChecks': countChecks
        });
    }

    res.status(200).send(JSON.stringify(habitCheck));
});

exports.updateAreas = functions.https.onRequest(async (req, res) => {
    const { uid, areas } = req.body;

    await db.collection('user')
        .doc(uid)
        .update({
            areas: areas
        });

    res.status(200).send(uid);
});

exports.createHabit = functions.https.onRequest(async (req, res) => {
    const { uid, color, name, areas } = req.body;

    const newHabit = await db.collection('user')
        .doc(uid)
        .collection('habit')
        .add({
            color: color,
            name: name,
            areas: areas,
            dateCreated: admin.firestore.Timestamp.fromDate(new Date())
        });

    console.log('createHabit: Done', newHabit.id);
    res.status(200).send(newHabit.id);
});

exports.updateHabit = functions.https.onRequest(async (req, res) => {
    const { uid, habitID, color, name, areas } = req.body;

    await db.collection('user')
        .doc(uid)
        .collection('habit')
        .doc(habitID)
        .update({
            color: color,
            name: name,
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

// Date-String conversion
const dateToString = (date) => `${date.getDate()}${date.getMonth() + 1}${date.getFullYear()}`;
const generateTodayId = () => dateToString(new Date());