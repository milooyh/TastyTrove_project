package com.app.dao.mustEatPlace.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.mustEatPlace.MustEatPlaceDAO;
import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceMenu;
import com.app.dto.mustEatPlace.MustEatPlaceWithMenu;

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

	@Override
	public int removeMustEatPlaceById(int id) {
		int result = sqlSessionTemplate.delete("mustEatPlace_mapper.removeMustEatPlace", id);
		return result;
	}

	@Override
	public List<MustEatPlaceWithMenu> findMustEatPlaceWithMenu() {
		List<MustEatPlaceWithMenu> mustEatPlaceWithMenu = sqlSessionTemplate.selectList("mustEatPlace_mapper.findMustEatPlaceWithMenu");
		return mustEatPlaceWithMenu;
	}

	@Override
	public int modifyMustEatPlace(MustEatPlace mustEatPlace) {
		int result = sqlSessionTemplate.update("mustEatPlace_mapper.modifyMustEatPlace", mustEatPlace);
		return result;
	}

	@Override
	public MustEatPlace findMustEatPlaceById(int id) {
		MustEatPlace mustEatPlace = sqlSessionTemplate.selectOne("mustEatPlace_mapper.findMustEatPlaceById", id);
		return mustEatPlace;
	}

	@Override
	public List<MustEatPlaceMenu> findMustEatPlaceMenuById(int id) {
		List<MustEatPlaceMenu> mustEatPlaceMenu= sqlSessionTemplate.selectList("mustEatPlace_mapper.findMustEatPlaceMenuById", id);
		return mustEatPlaceMenu;
	}

}
