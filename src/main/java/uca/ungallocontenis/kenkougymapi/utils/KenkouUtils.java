package uca.ungallocontenis.kenkougymapi.utils;

import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;

public class KenkouUtils {
    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(KenkouUtils.class);
    public final static DateTimeFormatter dd_MM_yyyy = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    public static String toString(Object object) {
        return String.valueOf(object);
    }
    
    public static Integer toInteger(Object object) {
        Integer valorInt = 0;

        try {
            valorInt = Integer.parseInt(String.valueOf(object));
        } catch (NumberFormatException e) {
            LOG.error("Error when converting object " + object + " in integer", e);
        }

        return valorInt;
    }

    public static Long toLong(Object object) {
        Long valorLong = 0L;

        try {
            valorLong = Long.parseLong(String.valueOf(object));
        } catch (NumberFormatException e) {
            LOG.error("Error when converting object " + object + " in long", e);
        }

        return valorLong;
    }
}
