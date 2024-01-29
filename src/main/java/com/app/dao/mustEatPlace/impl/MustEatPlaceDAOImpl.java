package com.app.dao.mustEatPlace.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.mustEatPlace.MustEatPlaceDAO;
import com.app.dto.mustEatPlace.MustEatPlace;

@Repository
public class MustEatPlaceDAOImpl implements MustEatPlaceDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int saveMustEatPlace(MustEatPlace mustEatPlace) {
		int result = sqlSessionTemplate.insert("mustEatPlace_mapper.saveMustEatPlace", mustEatPlace);
		return result;
	}

	@Override
	public List<MustEatPlace> findMustEatPlaceList() {
		List<MustEatPlace> mustEatPlace = sqlSessionTemplate.selectList("mustEatPlace_mapper.findMustEatPlace");
		return mustEatPlace;
	}

}
