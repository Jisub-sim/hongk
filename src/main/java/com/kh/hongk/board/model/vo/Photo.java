package com.kh.hongk.board.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class Photo {
	private MultipartFile Filedata;
	private String callback;
	private String callback_func;
	
	public Photo() {}

	public Photo(MultipartFile filedata, String callback, String callback_func) {
		super();
		Filedata = filedata;
		this.callback = callback;
		this.callback_func = callback_func;
	}

	public MultipartFile getFiledata() {
		return Filedata;
	}

	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}

	@Override
	public String toString() {
		return "Photo [Filedata=" + Filedata + ", callback=" + callback + ", callback_func=" + callback_func + "]";
	}
	
	
}
