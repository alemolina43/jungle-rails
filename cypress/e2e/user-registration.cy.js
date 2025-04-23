describe("Register page", () => {
  it("Can register a new user", () => {
    cy.visit("/signup");
    cy.get("#user_name").type("Bob");
    cy.get("#user_last_name").type("Square");
    cy.get("#user_email").type("bob@square.com");
    cy.get("#user_password").type("12345678");
    cy.get("#user_password_confirmation").type("12345678");
    cy.get(".btn").click();
    cy.contains("Logged in as Bob");

    cy.contains("Logout").click({ force: true });

    cy.contains("Login").click({ force: true });

    cy.contains("Log In");
    cy.get("#email").type("bob@square.com");
    cy.get("#password").type("12345678");
    cy.get(".btn").click();
    cy.contains("Logged in as Bob");
  });
});
