describe("Home Page", () => {
  beforeEach(() => {
    cy.visit("/");

    cy.contains("Welcome");
  });

  it("Increases cart count by 1 when clickin on 'Add to cart' button", () => {
    cy.contains("My Cart (0)");
    cy.contains("Add").first().click({ force: true });
    cy.contains("My Cart (1)");
  });
});
