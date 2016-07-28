package generator;

import java.io.*;
import java.sql.*;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class AdministratorsGenerator implements IdentifierGenerator {

	public Serializable generate(SessionImplementor session, Object object)
			throws HibernateException {

		String prefix = "admin";
		String administrators = null;
		Connection con = session.connection();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT NEXT VALUE FOR administrators_seq as nextval");
			rs.next();
			int nextval = rs.getInt("nextval");
			administrators = prefix + nextval;
			
		} catch (SQLException e) {
			throw new HibernateException("Unable to generate Sequence");
		}
		return administrators;
	}
}

