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
      username: 'Batman',
      time: '5 hrs ago',
      postcontent: 'I am Batman!',
      posting: 'assets/batman.jpg',
      numcomments: '3',
      numshare: '7',
      isLiked: false,
      comments: initialComments(),
    ),
    Userpost(
      userimg: 'assets/person4.jfif',
      username: 'Jungkok',
      time: '5 hrs ago',
      postcontent: 'la peace!',
      posting: 'assets/lapis.jpg',
      numcomments: '3',
      numshare: '7',
      isLiked: false,
      comments: initialComments(),
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/1.jpg', name: 'Alice'),
    Friend(img: 'assets/2.jpg', name: 'Bob'),
    Friend(img: 'assets/3.jpg', name: 'Charlie'),
    Friend(img: 'assets/4.jpg', name: 'Diana'),
    Friend(img: 'assets/5.jpg', name: 'Ethan'),
    Friend(img: 'assets/6.jpg', name: 'Fiona'),
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
    name: 'Red Xavier Rodrigo',
    email: 'redxavier28@gmail.com',
    img: 'assets/reddd.jpg',
    numFollowers: '1 Million',
    numPosts: '350',
    numFollowing: '1',
    numFriends: '400',
  );
}

