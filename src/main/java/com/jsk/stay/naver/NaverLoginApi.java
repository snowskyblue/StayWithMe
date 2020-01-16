package com.jsk.stay.naver;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20{
	protected NaverLoginApi() {
		//积己磊 积己
	}
	private static class InstanceHolder{
		//郴何 努贰胶
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}
	public static NaverLoginApi instance() {
		return InstanceHolder.INSTANCE;
	}
	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token";
	}
	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
	
}
