
INSERT INTO OAuthProvider (oAuthProviderName) VALUES ('google'), ('facebook'), ('github'), ('outlook'), ('myAss');

with rows as (
    INSERT INTO EndUser (firstName, lastName, userName, email, passcode, emailConfirmed, age) VALUES
        ('peter', 'parker', 'SpiderMan', 'iamspiderman@gmx.de', 'uv236pö1u2354', false, 18) RETURNING endUserID
    )
INSERT INTO OAuthUser (endUserID, oAuthProviderID, oAuthUserName) VALUES (
    (SELECT enduserid from rows), 
    (SELECT oAuthProviderID FROM oAuthProvider WHERE oAuthProviderName = 'google'),
        'DieDickeSpinne');

with rows as (
    INSERT INTO EndUser (firstName, lastName, userName, email, passcode, emailConfirmed, age) VALUES
        ('karl', 'stoerzel', 'IAmCookieZ', 'iamcookiez@gmail.cz', '23k5b345bg15', true, 23) RETURNING endUserID
    )
INSERT INTO OAuthUser (endUserID, oAuthProviderID, oAuthUserName) VALUES (
    (SELECT enduserid from rows), 
    (SELECT oAuthProviderID FROM oAuthProvider WHERE oAuthProviderName = 'google'),
        'fetteSosse');
INSERT INTO OAuthUser (endUserID, oAuthProviderID, oAuthUserName) VALUES (
    (SELECT enduserid from EndUser where userName = 'IAmCookieZ'),
    (SELECT oAuthProviderID FROM oAuthProvider WHERE oAuthProviderName = 'github'),
    'fetteSosse');
INSERT INTO OAuthUser (endUserID, oAuthProviderID, oAuthUserName) VALUES (
    (SELECT enduserid from EndUser where userName = 'IAmCookieZ'),
    (SELECT oAuthProviderID FROM oAuthProvider WHERE oAuthProviderName = 'google'),
    'fetteSosse');

with rows as (
    INSERT INTO EndUser (firstName, lastName, userName, email, passcode, emailConfirmed, age) VALUES
        ('Peter', 'griffin', 'TheDad', 'manIsuisDad@gmx.de', 'hj342513425b5', true, 42) RETURNING endUserID
    )
INSERT INTO OAuthUser (endUserID, oAuthProviderID, oAuthUserName) VALUES (
    (SELECT enduserid from rows), 
    (SELECT oAuthProviderID FROM oAuthProvider WHERE oAuthProviderName = 'facebook'),
        'fatPete');
INSERT INTO OAuthUser (endUserID, oAuthProviderID, oAuthUserName) VALUES (
    (SELECT enduserid from EndUser where userName = 'TheDad'),
    (SELECT oAuthProviderID FROM oAuthProvider WHERE oAuthProviderName = 'facebook'),
    'fadDad');

with rows as (
    INSERT INTO EndUser (firstName, lastName, userName, email, passcode, emailConfirmed, age) VALUES
        ('Lois', 'griffin', 'TheMum', 'dudeJeSuisMum@gmail.com', '8235b3256u1dvf', true, 38) RETURNING endUserID
    )
INSERT INTO OAuthUser (endUserID, oAuthProviderID, oAuthUserName) VALUES (
    (SELECT enduserid from rows), 
    (SELECT oAuthProviderID FROM oAuthProvider WHERE oAuthProviderName = 'myAss'),
        'EinLoisIsKeinLois');
INSERT INTO OAuthUser (endUserID, oAuthProviderID, oAuthUserName) VALUES (
    (SELECT enduserid from EndUser where userName = 'TheMum'),
    (SELECT oAuthProviderID FROM oAuthProvider WHERE oAuthProviderName = 'github'),
    'Milfimilf');

INSERT INTO EndUser (firstName, lastName, userName, email, passcode, emailConfirmed, age) VALUES
    ('Barney', 'Stinson', 'LorenzoVonMatterhorn', 'BSGetsBJ@outlook.com', 'MyBodyCountIsTwoHundred', false, 29);
