package com.musicstage.spring.board.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Reply {
   
   private int reply_number;
   private String reply_content;
   private Timestamp r_write_date;
   private int step_number;
   private char reply_enabled;
   private int parent_number;
   private String r_writer;
   private String r_writer_nickName;   // 댓글 작성자 닉네임
   private String profile_pic;         // 댓글 작성자 프로필 사진
   private int ref_board_number;      // 댓글 단 게시글 번호
   private ArrayList<Reply> child_reply; 
   private int reply_count;
   
   public Reply() {
      // TODO Auto-generated constructor stub
   }

   public Reply(int reply_number, String reply_content, Timestamp r_write_date, int step_number, char reply_enabled,
         int parent_number, String r_writer, String r_writer_nickName, String profile_pic, int ref_board_number,
         ArrayList<Reply> child_reply, int reply_count) {
      super();
      this.reply_number = reply_number;
      this.reply_content = reply_content;
      this.r_write_date = r_write_date;
      this.step_number = step_number;
      this.reply_enabled = reply_enabled;
      this.parent_number = parent_number;
      this.r_writer = r_writer;
      this.r_writer_nickName = r_writer_nickName;
      this.profile_pic = profile_pic;
      this.ref_board_number = ref_board_number;
      this.child_reply = child_reply;
      this.reply_count = reply_count;
   }

   public int getReply_number() {
      return reply_number;
   }

   public void setReply_number(int reply_number) {
      this.reply_number = reply_number;
   }

   public String getReply_content() {
      return reply_content;
   }

   public void setReply_content(String reply_content) {
      this.reply_content = reply_content;
   }

   public Timestamp getR_write_date() {
      return r_write_date;
   }

   public void setR_write_date(Timestamp r_write_date) {
      this.r_write_date = r_write_date;
   }

   public int getStep_number() {
      return step_number;
   }

   public void setStep_number(int step_number) {
      this.step_number = step_number;
   }

   public char getReply_enabled() {
      return reply_enabled;
   }

   public void setReply_enabled(char reply_enabled) {
      this.reply_enabled = reply_enabled;
   }

   public int getParent_number() {
      return parent_number;
   }

   public void setParent_number(int parent_number) {
      this.parent_number = parent_number;
   }

   public String getR_writer() {
      return r_writer;
   }

   public void setR_writer(String r_writer) {
      this.r_writer = r_writer;
   }

   public String getR_writer_nickName() {
      return r_writer_nickName;
   }

   public void setR_writer_nickName(String r_writer_nickName) {
      this.r_writer_nickName = r_writer_nickName;
   }

   public String getProfile_pic() {
      return profile_pic;
   }

   public void setProfile_pic(String profile_pic) {
      this.profile_pic = profile_pic;
   }

   public int getRef_board_number() {
      return ref_board_number;
   }

   public void setRef_board_number(int ref_board_number) {
      this.ref_board_number = ref_board_number;
   }

   public ArrayList<Reply> getChild_reply() {
      return child_reply;
   }

   public void setChild_reply(ArrayList<Reply> child_reply) {
      this.child_reply = child_reply;
   }
   
   public int getReply_count() {
      return reply_count;
   }

   public void setReply_count(int reply_count) {
      this.reply_count = reply_count;
   }
   

   @Override
   public String toString() {
      return "Reply [reply_number=" + reply_number + ", reply_content=" + reply_content + ", r_write_date="
            + r_write_date + ", step_number=" + step_number + ", reply_enabled=" + reply_enabled
            + ", parent_number=" + parent_number + ", r_writer=" + r_writer + ", r_writer_nickName="
            + r_writer_nickName + ", profile_pic=" + profile_pic + ", ref_board_number=" + ref_board_number
            + ", child_reply=" + child_reply + ", reply_count=" + reply_count + "]";
   }
}