import 'package:flutter/material.dart';
import '../model/userpost.dart';
import '../model/usercomment.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userPost});

  final Userpost userPost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _commentController = TextEditingController();

  var nametxtStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        widget.userPost.comments.add(
          Usercomment(
            commenterImg: 'assets/gabrielle.png',
            commenterName: 'Gabrielle Alimong',
            commentTime: 'Just now',
            commentContent: text,
          ),
        );
        widget.userPost.numcomments = '${widget.userPost.comments.length}';
      });
      _commentController.clear();
    }
  }

  Widget userline(Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userPost.userimg),
          radius: 20,
        ), // CircleAvatar
      ), // Container
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(userPost.time),
              const Text('.'),
              const Icon(Icons.group, size: 15, color: Colors.grey),
            ],
          ), // Row
        ],
      ), // Column
    ],
  ); // Row

  Widget postimage(Userpost userPost) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [Text(userPost.postcontent)]),
        const SizedBox(height: 15),
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.posting),
              fit: BoxFit.fill,
            ), // DecorationImage
          ), // BoxDecoration
        ), // Container
      ],
    ), // Column
  ); // Padding

  Widget buttons(Userpost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: userPost.isLiked ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  userPost.isLiked = !userPost.isLiked;
                });
              },
              icon: const Icon(Icons.thumb_up, size: 20),
              label: const Text('Like'),
            ), // TextButton.icon
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {
                // Scroll or focus on comment input
                _commentController.clear();
                FocusScope.of(context).requestFocus(FocusNode());
              },
              icon: const Icon(Icons.chat_bubble, size: 20),
              label: const Text('Comment'),
            ), // TextButton.icon
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: const Text('Share'),
            ), // TextButton.icon
          ],
        ), // Row
      ), // Padding
      const Divider(color: Colors.grey),
    ],
  ); // Column

  Widget commenters(Userpost userPost) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${userPost.numcomments} Comments'),
        const SizedBox(width: 10),
        Text('${userPost.numshare} Shares'),
      ],
    ),
  );

  Widget userpostdetails(Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userComment.commenterImg),
          radius: 18,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userComment.commenterName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(userComment.commentContent),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    userComment.commentTime,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Like',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Reply',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _commentInputField() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
    ),
    child: Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/gabrielle.png'),
          radius: 16,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Write a comment...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
            onSubmitted: (_) => _addComment(),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: _addComment,
          icon: const Icon(Icons.send, color: Colors.blue),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ), // IconButton
      ), // AppBar
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                userline(widget.userPost),
                postimage(widget.userPost),
                commenters(widget.userPost),
                buttons(widget.userPost),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        '${widget.userPost.comments.length}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      const Text('All Comments'),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                // FIX: Use NeverScrollableScrollPhysics to avoid nested scroll conflict
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: widget.userPost.comments
                      .map((userComment) => userpostdetails(userComment))
                      .toList(),
                ), // ListView
              ],
            ), // ListView
          ),
          // Comment input field at the bottom
          _commentInputField(),
        ],
      ),
    ); // Scaffold
  }
}

