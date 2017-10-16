package com.renrenlab.cms.common.response;

import java.io.Serializable;
import java.util.List;

public class ListSlice <T> implements Serializable{
	
	private static final long serialVersionUID = -3414631093956879278L;
	private long total;
	private List<T> content;

	public ListSlice() {
		this.total = 0;
	}
	
	public ListSlice(long total, List<T> content) {
		this.total = total;
		this.content = content;
	}

	public long getTotal() {
		return total;
	}

	public List<T> getContent() {
		return content;
	}

	@Override
	public String toString() {
		return "ListSlice [total=" + total + ", content=" + content + "]";
	}

}
