package com.musicstage.spring.board.model.vo;

import java.sql.Timestamp;

public class BoardFile {
	private int file_number;
	private String file_origin_name;
	private String file_change_name;
	private String file__extension_name;
	private String file_size;
	private Timestamp file_upload_date;
	private String file_path;
	private char file_thumbnail;
	private int board_number;
	private int file_type;
	private String file_uploader;
	
	public BoardFile() {}

	public BoardFile(int file_number, String file_origin_name, String file_change_name, String file__extension_name,
			String file_size, Timestamp file_upload_date, String file_path, char file_thumbnail, int board_number,
			int file_type, String file_uploader) {
		super();
		this.file_number = file_number;
		this.file_origin_name = file_origin_name;
		this.file_change_name = file_change_name;
		this.file__extension_name = file__extension_name;
		this.file_size = file_size;
		this.file_upload_date = file_upload_date;
		this.file_path = file_path;
		this.file_thumbnail = file_thumbnail;
		this.board_number = board_number;
		this.file_type = file_type;
		this.file_uploader = file_uploader;
	}
	

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

	public String getFile__extension_name() {
		return file__extension_name;
	}

	public void setFile__extension_name(String file__extension_name) {
		this.file__extension_name = file__extension_name;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public Timestamp getFile_upload_date() {
		return file_upload_date;
	}

	public void setFile_upload_date(Timestamp file_upload_date) {
		this.file_upload_date = file_upload_date;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public char getFile_thumbnail() {
		return file_thumbnail;
	}

	public void setFile_thumbnail(char file_thumbnail) {
		this.file_thumbnail = file_thumbnail;
	}

	public int getBoard_number() {
		return board_number;
	}

	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}

	public int getFile_type() {
		return file_type;
	}

	public void setFile_type(int file_type) {
		this.file_type = file_type;
	}

	public String getFile_uploader() {
		return file_uploader;
	}

	public void setFile_uploader(String file_uploader) {
		this.file_uploader = file_uploader;
	}

	@Override
	public String toString() {
		return "BoardFile [file_number=" + file_number + ", file_origin_name=" + file_origin_name
				+ ", file_change_name=" + file_change_name + ", file__extension_name=" + file__extension_name
				+ ", file_size=" + file_size + ", file_upload_date=" + file_upload_date + ", file_path=" + file_path
				+ ", file_thumbnail=" + file_thumbnail + ", board_number=" + board_number + ", file_type=" + file_type
				+ ", file_uploader=" + file_uploader + "]";
	}

	
	
	
	
}
