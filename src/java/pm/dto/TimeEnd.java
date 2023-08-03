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
public class TimeEnd implements Serializable{
    private int id;
    private int timeEnd;

    public TimeEnd() {
    }

    public TimeEnd(int id, int timeEnd) {
        this.id = id;
        this.timeEnd = timeEnd;
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
     * @return the timeEnd
     */
    public int getTimeEnd() {
        return timeEnd;
    }

    /**
     * @param timeEnd the timeEnd to set
     */
    public void setTimeEnd(int timeEnd) {
        this.timeEnd = timeEnd;
    }
    
    
}
