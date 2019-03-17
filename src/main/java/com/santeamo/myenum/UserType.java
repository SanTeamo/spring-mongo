package com.santeamo.myenum;

public enum UserType {
    ADMIN(0),USER(1),SELLER(2);

    private Integer type;

    private UserType(Integer type) {
        this.type = type;
    }

    public Integer getType(){
        return type;
    }
}
