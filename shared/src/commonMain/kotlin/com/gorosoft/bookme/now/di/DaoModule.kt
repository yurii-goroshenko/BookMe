package com.gorosoft.bookme.now.di

import com.gorosoft.bookme.now.data.database.AppDatabase
import com.gorosoft.bookme.now.data.database.dao.ProfileDao
import org.koin.dsl.module

fun daoModule() = module {
    single<ProfileDao> { val db: AppDatabase = get(); db.profileDao() }
}
