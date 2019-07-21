class BannerModel {
  final String svgUri;
  final String title;
  final String subtitle;

  BannerModel(this.svgUri, this.title, this.subtitle);

  static List<BannerModel> defaultBanners() {
    return [
      BannerModel("banner_recommendations.svg", "Encontre grupos de recomendação perto de você",
          "Encontre grupos de recomendação perto de você"),
      BannerModel("banner_drivers.svg", "Motoristas de app",
          "Behive é a melhor solução para tornar o seu grupo de recomendações, vendas, vizinhanças mais efetivo."),
      BannerModel("banner_schools.svg", "Escolas",
          "Behive é a melhor solução para tornar o seu grupo de recomendações, vendas, vizinhanças mais efetivo."),
      BannerModel("banner_construction.svg", "Construção",
          "Behive é a melhor solução para tornar o seu grupo de recomendações, vendas, vizinhanças mais efetivo."),
    ];
  }
}
