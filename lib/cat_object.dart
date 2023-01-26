class CatObject {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  int likes;

  CatObject({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.likes,
  });

  factory CatObject.create() {
    return CatObject(
      id: 'id',
      title: 'The cutest cat',
      subtitle: 'Russian Blue Cat',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Russian_Blue_Cat_Looking_Up.jpg/360px-Russian_Blue_Cat_Looking_Up.jpg',
      likes: 0,
    );
  }
}
