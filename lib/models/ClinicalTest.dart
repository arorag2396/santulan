abstract class ClinicalTest {
  String title;
  String shortDescription;
  String fullDescription;
  String imageUrl;

  ClinicalTest(
      this.title, this.shortDescription, this.fullDescription, this.imageUrl);

  void processTest();
}
