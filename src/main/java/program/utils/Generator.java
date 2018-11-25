package program.utils;

import java.util.Objects;

public class Generator {

    public String getPath(String xmlFileName) {
        return Objects.requireNonNull(getClass().getClassLoader().getResource(xmlFileName)).getPath();
    }

}