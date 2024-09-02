CREATE EXTENSION moddatetime;
CREATE EXTENSION insert_username;

CREATE TRIGGER created_by
  BEFORE INSERT ON standard 
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER created_by
  BEFORE INSERT ON nonstandard 
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER created_on
  BEFORE INSERT ON standard
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (moddate);

CREATE TRIGGER created_on
  BEFORE INSERT ON nonstandard
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (moddate);

CREATE TRIGGER created_on
	BEFORE INSERT ON users
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (moddate);

CREATE TRIGGER updated_by
	BEFORE UPDATE ON standard 
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER updated_on
	BEFORE UPDATE ON standard
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (datetime);

CREATE TRIGGER updated_by
	BEFORE UPDATE ON nonstandard
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER updated_on
	BEFORE UPDATE ON nonstandard
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (datetime);

