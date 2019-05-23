package com.santeamo.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Document(collection = "keyword")
public class KeyWord implements Serializable {
    private static final long serialVersionUID = 8554172208025984861L;

    @Id
    private String id;

    private Integer catId;

    private String value;

    public KeyWord() {
    }

    public KeyWord(String id, Integer catId, String value) {
        this.id = id;
        this.catId = catId;
        this.value = value;
    }

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "KeyWord{" +
                "id='" + id + '\'' +
                ", value='" + value + '\'' +
                '}';
    }
}
