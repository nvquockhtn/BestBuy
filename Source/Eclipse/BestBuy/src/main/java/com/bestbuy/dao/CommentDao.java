/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.dao;

import java.util.ArrayList;

import com.bestbuy.pojo.Comment;

/**
 *
 * @author VanQuoc-CNTT
 */
public interface CommentDao {
    public boolean add(Comment comment);
    public ArrayList<Comment> getListCommentByIdAccount(int IdAccount);
    public boolean deleteCommentByIdComment(int IdComment);
    public Comment getCommentById(int IdComment);
}
