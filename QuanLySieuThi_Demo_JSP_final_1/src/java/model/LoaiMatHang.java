/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Xuan Toog
 */
public class LoaiMatHang {
    private int id;
    private String ten, moTa;
    private ArrayList<MatHang> listMatHang;
    
    public LoaiMatHang(){
        
    }

    public LoaiMatHang(String ten, String moTa, ArrayList<MatHang> listMatHang) {
        this.ten = ten;
        this.moTa = moTa;
        this.listMatHang = listMatHang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public ArrayList<MatHang> getListMatHang() {
        return listMatHang;
    }

    public void setListMatHang(ArrayList<MatHang> listMatHang) {
        this.listMatHang = listMatHang;
    }

    @Override
    public String toString() {
        return "LoaiMatHang{" + "id=" + id + ", ten=" + ten + ", moTa=" + moTa + ", listMatHang=" + listMatHang + '}';
    }
    
}
