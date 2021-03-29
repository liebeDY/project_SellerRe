package com.project.sellerre.user;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	void insertUser(User u);

	User selectUserId(String user_id);

	User selectUserNickName(String user_nickname);

	void updateUser(User u);

	void updateUserScore(Map map);

	void updateUserScoreCount(String user_id);

	void deleteUser(String id);

	int getTotalUserNum();

	int getTodayUserNum();

	int idCheck(String user_id);

	int nicknameCheck(String user_nickname);

	int emailCheck(String user_email);

	User selectUserEmail(String user_email);
}
