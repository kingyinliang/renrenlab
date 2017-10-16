package com.renrenlab.cms.common.pageutil;

import java.util.Collections;
import java.util.List;

/**
 * 
 * @author fuyujie Date 2017.04.25
 *
 */
public class Page<E> implements java.io.Serializable {

	private static final long serialVersionUID = 2020970953484002404L;

	private int pageShow = 2;
	private int totalPage;
	private int totalCount;
	private int start;
	private int nowPage;
	private List<E> result = Collections.emptyList();

	public int getPageShow() {
		return pageShow;
	}

	public void setPageShow(int pageShow) {
		this.pageShow = pageShow;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getNowPage() {
		if(nowPage<=0)
			nowPage = 1;
		if(nowPage>getTotalPage())
			nowPage = getTotalPage();
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public List<E> getResult() {
		return result;
	}

	public void setResult(List<E> result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "Page [pageShow=" + pageShow + ", totalPage=" + totalPage + ", totalCount=" + totalCount + ", start="
				+ start + ", nowPage=" + nowPage + ", result=" + result + "]";
	}

}