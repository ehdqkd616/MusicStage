package com.musicstage.spring.member.model.vo;

import java.sql.Date;

public class register_file {
	private int file_number; // ���� ��ȣ0
	private String file_origin_name; // ���Ͽ����̸� 0
	private String file_change_name; // ���� ��ȯ �̸� 0
	private String file_extension_name; // ���� Ȯ���� 0
	private String file_size; // ���� ������ 0
	private String file_upload; //���δ�
	private String file_path; // ���� ���  0
	private String file_thumbnail; //���� �����   0
	private int register_no; // ������ ��� ��ȣ0
	private int file_type; // ���� ����   0
	private Date file_upload_date;
	
	
	public Date getFile_upload_date() {
		return file_upload_date;
	}

	public void setFile_upload_date(Date file_upload_date) {
		this.file_upload_date = file_upload_date;
	}

	public register_file() {
		// TODO Auto-generated constructor stub
	}

	public register_file(int file_number, String file_origin_name, String file_change_name,
			String file_extension_name, String file_size, String file_upload, String file_path,
			String file_thumbnail, int register_no, int file_type, String file_uploader) {
		super();
		this.file_number = file_number;
		this.file_origin_name = file_origin_name;
		this.file_change_name = file_change_name;
		this.file_extension_name = file_extension_name;
		this.file_size = file_size;
		this.file_upload = file_upload;
		this.file_path = file_path;
		this.file_thumbnail = file_thumbnail;
		this.register_no = register_no;
		this.file_type = file_type;
		this.file_uploader = file_uploader;
	}

	
	public int getFile_type() {
		return file_type;
	}

	public void setFile_type(int file_type) {
		this.file_type = file_type;
	}

	private String file_uploader; // ���� ����
	
	public int getFile_number() {
		return file_number;
	}

	public void setFile_number(int file_number) {
		this.file_number = file_number;
	}

	public String getFile_origin_name() {
		return file_origin_name;
	}

	public void setFile_origin_name(String file_origin_name) {
		this.file_origin_name = file_origin_name;
	}

	public String getFile_change_name() {
		return file_change_name;
	}

	public void setFile_change_name(String file_change_name) {
		this.file_change_name = file_change_name;
	}

	public String getFile_extension_name() {
		return file_extension_name;
	}

	public void setFile_extension_name(String file_extension_name) {
		this.file_extension_name = file_extension_name;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public String getFile_upload() {
		return file_upload;
	}

	public void setfile_upload(String file_upload) {
		this.file_upload = file_upload;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_thumbnail() {
		return file_thumbnail;
	}

	public void setFile_thumbnail(String file_thumbnail) {
		this.file_thumbnail = file_thumbnail;
	}

	public int getRegister_no() {
		return register_no;
	}

	public void setRegister_no(int register_no) {
		this.register_no = register_no;
	}

	public String getFile_uploader() {
		return file_uploader;
	}

	public void setFile_uploader(String file_uploader) {
		this.file_uploader = file_uploader;
	}

	@Override
	public String toString() {
		return "register_file [file_number=" + file_number + ", file_origin_name=" + file_origin_name
				+ ", file_change_name=" + file_change_name + ", file_extension_name=" + file_extension_name
				+ ", file_size=" + file_size + ", file_upload_date=" + file_upload + ", file_path=" + file_path
				+ ", file_thumbnail=" + file_thumbnail + ", register_no=" + register_no + ", file_type=" + file_type
				+ ", file_uploader=" + file_uploader + "]";
	}

	
	
	
}
