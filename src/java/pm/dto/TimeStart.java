/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dto;

import java.io.Serializable;

/**
 *
 * @author tranh
 */
public class TimeStart implements Serializable{
    private int id;
    private int timeStart;

    public TimeStart() {
    }

    public TimeStart(int id, int timeStart) {
        this.id = id;
        this.timeStart = timeStart;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the timeStart
     */
    public int getTimeStart() {
        return timeStart;
    }

    /**
     * @param timeStart the timeStart to set
     */
    public void setTimeStart(int timeStart) {
        this.timeStart = timeStart;
    }
    
    
}
