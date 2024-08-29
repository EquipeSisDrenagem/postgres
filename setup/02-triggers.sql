CREATE EXTENSION moddatetime;
CREATE EXTENSION insert_username;

CREATE TRIGGER created_by
	BEFORE INSERT ON drains
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER created_on
	BEFORE INSERT ON drains
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (moddate);

CREATE TRIGGER created_on
	BEFORE INSERT ON users
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (moddate);

CREATE TRIGGER updated_by
	BEFORE UPDATE ON drains
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER updated_on
	BEFORE UPDATE ON drains
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (datetime);

