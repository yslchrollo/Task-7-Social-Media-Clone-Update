import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class Userdata {
  static List<Usercomment> initialComments() => [
    Usercomment(
      commenterImg: 'assets/person1.jfif',
      commenterName: 'Jane Smith',
      commentTime: '1 hr ago',
      commentContent: 'Looks fun!',
    ),
    Usercomment(
      commenterImg: 'assets/person3.jfif',
      commenterName: 'Mike Johnson',
      commentTime: '30 mins ago',
      commentContent: 'Wish I was there!',
    ),
    Usercomment(
      commenterImg: 'assets/person4.jfif',
      commenterName: 'Emily Davis',
      commentTime: '15 mins ago',
      commentContent: 'Great photo!',
    ),
  ];

  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/person1.jfif',
      username: 'John Karl',
      time: '2 hrs ago',
      postcontent: 'Had a great day at the beach!',
      posting: 'assets/post_john_karl.png',
      numcomments: '3',
      numshare: '5',
      isLiked: false,
      comments: initialComments(),
    ),
    Userpost(
      userimg: 'assets/person2.jfif',
      username: 'Jane Smith',
      time: '3 hrs ago',
      postcontent: 'Loving the new cafe in town.',
      posting: 'assets/post_jane_smith.png',
      numcomments: '3',
      numshare: '3',
      isLiked: true,
      comments: initialComments(),
    ),
    Userpost(
      userimg: 'assets/person3.jfif',
      username: 'Mike Johnson',
      time: '5 hrs ago',
      postcontent: 'Just finished a 10k run!',
      posting: 'assets/post_mike_johnson.png',
      numcomments: '3',
      numshare: '7',
      isLiked: false,
      comments: initialComments(),
    ),
    Userpost(
      userimg: 'assets/person4.jfif',
      username: 'Johnson Stewart',
      time: '5 hrs ago',
      postcontent: 'Just finished a 10k run!',
      posting: 'assets/post_johnson_stewart.png',
      numcomments: '3',
      numshare: '7',
      isLiked: false,
      comments: initialComments(),
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/friend_alice.png', name: 'Alice'),
    Friend(img: 'assets/friend_bob.png', name: 'Bob'),
    Friend(img: 'assets/friend_charlie.png', name: 'Charlie'),
    Friend(img: 'assets/friend_diana.png', name: 'Diana'),
    Friend(img: 'assets/friend_ethan.png', name: 'Ethan'),
    Friend(img: 'assets/friend_fiona.png', name: 'Fiona'),
  ];

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'assets/person1.jfif',
      commenterName: 'Jane Smith',
      commentTime: '1 hr ago',
      commentContent: 'Looks fun!',
    ),
    Usercomment(
      commenterImg: 'assets/person3.jfif',
      commenterName: 'Mike Johnson',
      commentTime: '30 mins ago',
      commentContent: 'Wish I was there!',
    ),
    Usercomment(
      commenterImg: 'assets/person4.jfif',
      commenterName: 'Emily Davis',
      commentTime: '15 mins ago',
      commentContent: 'Great photo!',
    ),
  ];

  Account myUserAccount = Account(
    name: 'Gabrielle Alimong',
    email: 'gabriellealimong2gmail.com',
    img: 'assets/gabrielle.png',
    numFollowers: '1 Million',
    numPosts: '350',
    numFollowing: '1',
    numFriends: '400',
  );
}

