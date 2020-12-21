package com.musicstage.spring.board.model.vo;

public class FileType {
	private int file_type;
	private String file_type_name;
	
	public FileType() {}

	public FileType(int file_type, String file_type_name) {
		super();
		this.file_type = file_type;
		this.file_type_name = file_type_name;
	}

	public int getFile_type() {
		return file_type;
	}

	public void setFile_type(int file_type) {
		this.file_type = file_type;
	}

	public String getFile_type_name() {
		return file_type_name;
	}

	public void setFile_type_name(String file_type_name) {
		this.file_type_name = file_type_name;
	}

	@Override
	public String toString() {
		return "FileType [file_type=" + file_type + ", file_type_name=" + file_type_name + "]";
	}
	
	
	
}
