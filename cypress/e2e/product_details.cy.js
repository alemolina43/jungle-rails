describe("Home Page", () => {
  beforeEach(() => {
    cy.visit("/");

    cy.contains("Welcome");
  });

  it("Can navigate from the home page to the product detail page", () => {
    cy.get(".products article").first().click();
    cy.contains("article.product-detail p", "It blooms once a year");
  });
});
