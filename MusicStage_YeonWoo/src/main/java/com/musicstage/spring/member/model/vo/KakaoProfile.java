package com.musicstage.spring.member.model.vo;

public class KakaoProfile {

public Integer id;
public String connected_at;
public Properties properties;
public KakaoAccount kakao_account;


	public class Properties {
	
		public String nickname;
		public String profile_image;
		public String thumbnail_image;
		
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		public String getProfile_image() {
			return profile_image;
		}
		public void setProfile_image(String profile_image) {
			this.profile_image = profile_image;
		}
		public String getThumbnail_image() {
			return thumbnail_image;
		}
		public void setThumbnail_image(String thumbnail_image) {
			this.thumbnail_image = thumbnail_image;
		}
		
	}

	public class KakaoAccount {
		
		public Boolean profile_needs_agreement;
		public Profile profile;
		public Boolean has_email;
		public Boolean email_needs_agreement;
		public Boolean is_email_valid;
		public Boolean is_email_verified;
		public String email;

		public class Profile {
	
			public String nickname;
			public String thumbnail_image_url;
			public String profile_image_url;
			
			public String getNickname() {
				return nickname;
			}
			public void setNickname(String nickname) {
				this.nickname = nickname;
			}
			public String getThumbnail_image_url() {
				return thumbnail_image_url;
			}
			public void setThumbnail_image_url(String thumbnail_image_url) {
				this.thumbnail_image_url = thumbnail_image_url;
			}
			public String getProfile_image_url() {
				return profile_image_url;
			}
			public void setProfile_image_url(String profile_image_url) {
				this.profile_image_url = profile_image_url;
			}
			
		}

		public Boolean getProfile_needs_agreement() {
			return profile_needs_agreement;
		}

		public void setProfile_needs_agreement(Boolean profile_needs_agreement) {
			this.profile_needs_agreement = profile_needs_agreement;
		}

		public Profile getProfile() {
			return profile;
		}

		public void setProfile(Profile profile) {
			this.profile = profile;
		}

		public Boolean getHas_email() {
			return has_email;
		}

		public void setHas_email(Boolean has_email) {
			this.has_email = has_email;
		}

		public Boolean getEmail_needs_agreement() {
			return email_needs_agreement;
		}

		public void setEmail_needs_agreement(Boolean email_needs_agreement) {
			this.email_needs_agreement = email_needs_agreement;
		}

		public Boolean getIs_email_valid() {
			return is_email_valid;
		}

		public void setIs_email_valid(Boolean is_email_valid) {
			this.is_email_valid = is_email_valid;
		}

		public Boolean getIs_email_verified() {
			return is_email_verified;
		}

		public void setIs_email_verified(Boolean is_email_verified) {
			this.is_email_verified = is_email_verified;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getConnected_at() {
		return connected_at;
	}

	public void setConnected_at(String connected_at) {
		this.connected_at = connected_at;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public KakaoAccount getKakao_account() {
		return kakao_account;
	}

	public void setKakao_account(KakaoAccount kakao_account) {
		this.kakao_account = kakao_account;
	}

}