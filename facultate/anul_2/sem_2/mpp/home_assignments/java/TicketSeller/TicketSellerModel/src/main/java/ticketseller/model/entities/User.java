package ticketseller.model.entities;

import java.io.Serializable;

public class User implements Identifiable<String>, Serializable {
    private String username;
    private String password;

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String getId() {
        return username;
    }

    @Override
    public void setId(String s) {
        this.username = s;
    }
}
