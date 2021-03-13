CREATE TABLE user_profile (
    userID VARCHAR(255)   NOT NULL,
    latitude DECIMAL(20)   NOT NULL,
    longitude DECIMAL(20)   NOT NULL,
    smoker VARCHAR(255)   NOT NULL,
    drink_level VARCHAR(255)   NOT NULL,
    ambience VARCHAR(255)   NOT NULL,
    transport VARCHAR(255)   NOT NULL,
    religion VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_user_profile PRIMARY KEY (userID)
);


CREATE TABLE geoplaces (
    placeID INT   NOT NULL,
    latitude DECIMAL(20)   NOT NULL,
    longitude DECIMAL(20)   NOT NULL,
    name VARCHAR(255)   NOT NULL,
    city VARCHAR(255)   NOT NULL,
    alcohol VARCHAR(255)   NOT NULL,
    smoking_area VARCHAR(255)   NOT NULL,
    accessibility VARCHAR(255)   NOT NULL,
	ambience VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_geoplaces PRIMARY KEY (placeID)
);


CREATE TABLE rating (
    userID VARCHAR(255)   NOT NULL,
    placeID INT   NOT NULL,
    rating INT   NOT NULL,
    food_rating INT   NOT NULL,
    service_rating INT   NOT NULL,
	CONSTRAINT fk_rating_userID FOREIGN KEY(userID) REFERENCES user_profile (userID),
	CONSTRAINT fk_rating_placeID FOREIGN KEY(placeID) REFERENCES geoplaces (placeID)
);


CREATE TABLE cuisine (
    placeID INT   NOT NULL,
    cuisine VARCHAR(255)   NOT NULL,
	CONSTRAINT fk_cuisine_placeID FOREIGN KEY(placeID) REFERENCES geoplaces (placeID)
);


CREATE TABLE parking (
    placeID INT   NOT NULL,
    parking_lot VARCHAR(255)   NOT NULL,
	CONSTRAINT fk_parking_placeID FOREIGN KEY(placeID) REFERENCES geoplaces (placeID)
);

