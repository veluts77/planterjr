package objects;

public class JavaObject {

    private String name;

    public JavaObject() {
        name = "Undefined";
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getGreetingsMessage() {
        return "Hello from Java, dear " + name;
    }
}