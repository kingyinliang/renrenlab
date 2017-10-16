package com.renrenlab.cms.communication.model;

import java.io.Serializable;

public class VerifyCode implements Serializable {

    private static final long serialVersionUID = 7262952921604129906L;

    private Long id;

    private Long vId;

    private String vPhone;

    private Long vDeadline;

    private String vSmscode;

    private String vGraphcode;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getvId() {
        return vId;
    }

    public void setvId(Long vId) {
        this.vId = vId;
    }

    public String getvPhone() {
        return vPhone;
    }

    public void setvPhone(String vPhone) {
        this.vPhone = vPhone == null ? null : vPhone.trim();
    }

    public Long getvDeadline() {
        return vDeadline;
    }

    public void setvDeadline(Long vDeadline) {
        this.vDeadline = vDeadline;
    }

    public String getvSmscode() {
        return vSmscode;
    }

    public void setvSmscode(String vSmscode) {
        this.vSmscode = vSmscode == null ? null : vSmscode.trim();
    }

    public String getvGraphcode() {
        return vGraphcode;
    }

    public void setvGraphcode(String vGraphcode) {
        this.vGraphcode = vGraphcode == null ? null : vGraphcode.trim();
    }
}