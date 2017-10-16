package com.renrenlab.cms.communication.vo.params;

import java.io.Serializable;

/**
 * 发送方案 接收参数
 */
public class SendScheme implements Serializable {
	
	private static final long serialVersionUID = 3614815213728242634L;
	
	private Long uId;
	
	private Long[] schId;

	public Long getuId() {
		return uId;
	}

	public void setuId(Long uId) {
		this.uId = uId;
	}

	public Long[] getSchId() {
		return schId;
	}

	public void setSchId(Long[] schId) {
		this.schId = schId;
	}
}