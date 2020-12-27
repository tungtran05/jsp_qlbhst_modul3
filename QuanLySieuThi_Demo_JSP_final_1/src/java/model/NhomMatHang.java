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
public class NhomMatHang {
    private int id;
    private String ten, moTa;
    private ArrayList<LoaiMatHang> listLoaiMatHang;
    
    public NhomMatHang(){
        
    }

    public NhomMatHang(String ten, String moTa, ArrayList<LoaiMatHang> listLoaiMatHang) {
        this.ten = ten;
        this.moTa = moTa;
        this.listLoaiMatHang = listLoaiMatHang;
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

    public ArrayList<LoaiMatHang> getListLoaiMatHang() {
        return listLoaiMatHang;
    }

    public void setListLoaiMatHang(ArrayList<LoaiMatHang> listLoaiMatHang) {
        this.listLoaiMatHang = listLoaiMatHang;
    }

    @Override
    public String toString() {
        return "NhomMatHang{" + "id=" + id + ", ten=" + ten + ", moTa=" + moTa + ", listLoaiMatHang=" + listLoaiMatHang + '}';
    }
    
}
