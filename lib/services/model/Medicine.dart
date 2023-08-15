class Medicine{
    final String name;
    final String category;
    final String ImageURL;
    final String description;
    final String company;
    final double price;
    final double discount;
    final int OrderAmount;
    final int initialRating;
    final int numberOfStripes;
    final bool available;
    late final bool favorite;
    final bool hasDiscount;
    final bool hasStripe;
    Medicine({
      required this.numberOfStripes,
      required this.hasStripe,
      required this.initialRating,
      required this.company,
      required this.favorite,
      required this.name,
      required this.category,
      required this.ImageURL,
      required this.description,
      required this.price,
      required this.OrderAmount,
      required this.available,
      required this.discount,
      required this.hasDiscount,
    });

}