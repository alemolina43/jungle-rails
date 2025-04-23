describe("Login", () => {
  it("An existing user can log in", () => {
    cy.visit("/login");
    cy.get("#email").type("bob@bob.com");
    cy.get("#password").type("password");
    cy.get(".btn").click();
    cy.contains("Logged in as Bob");
  });
});
