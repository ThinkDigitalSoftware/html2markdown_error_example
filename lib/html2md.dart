String html =
    r"""<h1 class="hash-header" id="cloud-firestore-plugin-for-flutter">
  Cloud Firestore Plugin for Flutter
  <a href="#cloud-firestore-plugin-for-flutter" class="hash-link">#</a>
</h1>
<p>
  A Flutter plugin to use the
  <a href="https://firebase.google.com/docs/firestore/">Cloud Firestore API</a>.
</p>
<p>
  <a href="https://pub.dartlang.org/packages/cloud_firestore"
    ><img
      src="https://img.shields.io/pub/v/cloud_firestore.svg"
      alt="pub package"
  /></a>
</p>
<p>
  For Flutter plugins for other Firebase products, see
  <a
    href="https://github.com/FirebaseExtended/flutterfire/blob/master/README.md"
    >README.md</a
  >.
</p>
<p>
  <em>Note</em>: This plugin is still under development, and some APIs might not
  be available yet.
  <a href="https://github.com/FirebaseExtended/flutterfire/issues">Feedback</a>
  and
  <a href="https://github.com/FirebaseExtended/flutterfire/pulls"
    >Pull Requests</a
  >
  are most welcome!
</p>
<h2 class="hash-header" id="setup">
  Setup <a href="#setup" class="hash-link">#</a>
</h2>
<p>To use this plugin:</p>
<ol>
  <li>
    Using the
    <a href="http://console.firebase.google.com/">Firebase Console</a>, add an
    Android app to your project: Follow the assistant, download the generated
    google-services.json file and place it inside android/app. Next, modify the
    android/build.gradle file and the android/app/build.gradle file to add the
    Google services plugin as described by the Firebase assistant. Ensure that
    your <code>android/build.gradle</code> file contains the
    <code>maven.google.com</code> as
    <a href="https://firebase.google.com/docs/android/setup#add_the_sdk"
      >described here</a
    >.
  </li>
  <li>
    Using the
    <a href="http://console.firebase.google.com/">Firebase Console</a>, add an
    iOS app to your project: Follow the assistant, download the generated
    GoogleService-Info.plist file, open ios/Runner.xcworkspace with Xcode, and
    within Xcode place the file inside ios/Runner. Don't follow the steps named
    "Add Firebase SDK" and "Add initialization code" in the Firebase assistant.
  </li>
  <li>
    Add <code>cloud_firestore</code> as a
    <a href="https://flutter.io/platform-plugins/"
      >dependency in your pubspec.yaml file</a
    >.
  </li>
</ol>
<h2 class="hash-header" id="usage">
  Usage <a href="#usage" class="hash-link">#</a>
</h2>
<pre><code class="language-dart">import 'package:cloud_firestore/cloud_firestore.dart';
</code></pre>
<p>Adding a new <code>DocumentReference</code>:</p>
<pre><code class="language-dart">Firestore.instance.collection('books').document()
  .setData({ 'title': 'title', 'author': 'author' });
</code></pre>
<p>Binding a <code>CollectionReference</code> to a <code>ListView</code>:</p>
<pre><code class="language-dart">class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder&lt;QuerySnapshot&gt;(
      stream: Firestore.instance.collection('books').snapshots(),
      builder: (BuildContext context, AsyncSnapshot&lt;QuerySnapshot&gt; snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document['title']),
                  subtitle: new Text(document['author']),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
</code></pre>
<p>Performing a query:</p>
<pre><code class="language-dart">Firestore.instance
    .collection('talks')
    .where("topic", isEqualTo: "flutter")
    .snapshots()
    .listen((data) =&gt;
        data.documents.forEach((doc) =&gt; print(doc["title"])));
</code></pre>
<p>Get a specific document:</p>
<pre><code class="language-dart">Firestore.instance
        .collection('talks')
        .document('document-name')
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
    });
</code></pre>
<p>Running a transaction:</p>
<pre><code class="language-dart">final DocumentReference postRef = Firestore.instance.document('posts/123');
Firestore.instance.runTransaction((Transaction tx) async {
  DocumentSnapshot postSnapshot = await tx.get(postRef);
  if (postSnapshot.exists) {
    await tx.update(postRef, &lt;String, dynamic&gt;{'likesCount': postSnapshot.data['likesCount'] + 1});
  }
});
</code></pre>
<h2 class="hash-header" id="getting-started">
  Getting Started <a href="#getting-started" class="hash-link">#</a>
</h2>
<p>
  See the <code>example</code> directory for a complete sample app using Cloud
  Firestore.
</p>
""";
