package model;

import java.util.Date;

public class Post {
	private int post_id;
	private String consumer_id;
	private String title;
	private String content;
	private String post_file;
	private String file_link;
	private int down_count;
	private Date upload_date;

	public Post(int post_id) {
		super();
		this.post_id = post_id;
	}

	public Post(String consumer_id, String title, String content, String post_file, String file_link,
			int down_count, Date upload_date) {
		super();
		this.post_id = post_id;
		this.consumer_id = consumer_id;
		this.title = title;
		this.content = content;
		this.post_file = post_file;
		this.file_link = file_link;
		this.down_count = down_count;
		this.upload_date = upload_date;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getConsumer_id() {
		return consumer_id;
	}

	public void setConsumer_id(String consumer_id) {
		this.consumer_id = consumer_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPost_file() {
		return post_file;
	}

	public void setPost_file(String post_file) {
		this.post_file = post_file;
	}

	public String getFile_link() {
		return file_link;
	}

	public void setFile_link(String file_link) {
		this.file_link = file_link;
	}

	public int getDown_count() {
		return down_count;
	}

	public void setDown_count(int down_count) {
		this.down_count = down_count;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
}