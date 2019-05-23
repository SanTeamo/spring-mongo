package com.santeamo.model;

import java.util.ArrayList;

public class Chart {
    private ArrayList<String> categories = new ArrayList<>();
    private String name;
    private ArrayList<Integer> data = new ArrayList<>();
    private String title;

    public ArrayList<String> getCategories() {
        return categories;
    }

    public void setCategories(ArrayList<String> categories) {
        this.categories = categories;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Integer> getData() {
        return data;
    }

    public void setData(ArrayList<Integer> data) {
        this.data = data;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Chart{" +
                "categories=" + categories +
                ", name='" + name + '\'' +
                ", data=" + data +
                ", title='" + title + '\'' +
                '}';
    }
}
