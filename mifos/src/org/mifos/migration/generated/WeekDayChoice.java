//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.1.2-b01-fcs 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2007.04.03 at 01:24:13 PM PDT 
//


package org.mifos.migration.generated;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for weekDayChoice.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="weekDayChoice">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}token">
 *     &lt;enumeration value="MONDAY"/>
 *     &lt;enumeration value="TUESDAY"/>
 *     &lt;enumeration value="WEDNESDAY"/>
 *     &lt;enumeration value="THURSDAY"/>
 *     &lt;enumeration value="FRIDAY"/>
 *     &lt;enumeration value="SATURDAY"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "weekDayChoice")
@XmlEnum
public enum WeekDayChoice {

    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY;

    public String value() {
        return name();
    }

    public static WeekDayChoice fromValue(String v) {
        return valueOf(v);
    }

}
