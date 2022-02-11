-- INSERT YOUR SQL CODE HERE

CREATE TABLE IF NOT EXISTS OAuthProvider
(
    oAuthProviderID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    oAuthProviderName VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS EndUser
(
    endUserID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    userName VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    passcode VARCHAR(72) NOT NULL,
    emailConfirmed BOOLEAN NOT NULL,
    age INTEGER NOT NULL,
    currentOAuthUserID uuid
);

CREATE TABLE IF NOT EXISTS OAuthUser
(
    oAuthUserID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    endUserID uuid NOT NULL,
    oAuthProviderID uuid NOT NULL,
    oAuthUserName VARCHAR(50) NOT NULL,
    CONSTRAINT fk_endUser
        FOREIGN KEY(endUserID)
            REFERENCES EndUser(endUserID)
            ON DELETE CASCADE,
    CONSTRAINT fk_provider
        FOREIGN KEY(oAuthProviderID)
            REFERENCES OAuthProvider(oAuthProviderID)
            ON DELETE CASCADE
);

ALTER TABLE EndUser ADD FOREIGN KEY (currentOAuthUserID) REFERENCES OAuthUser(oAuthUserID) ON DELETE CASCADE;

-- CREATE TABLE IF NOT EXISTS Restriction
-- (
--     restrictionID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
--     restrictionName VARCHAR(50) NOT NULL 
-- );

-- CREATE TABLE IF NOT EXISTS EndUser_Restriction
-- (
--     connectionID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
--     alertActivation BOOLEAN NOT NULL,
--     endUserID uuid NOT NULL,
--     restrictionID uuid NOT NULL,
--     CONSTRAINT fk_endUser
--         FOREIGN KEY(endUserID)
--             REFERENCES EndUser(endUserID)
--             ON DELETE CASCADE,
--     CONSTRAINT fk_restrictionID
--         FOREIGN KEY(restrictionID)
--             REFERENCES Restriction(restrictionID)
--             ON DELETE CASCADE
-- );
