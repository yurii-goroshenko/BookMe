package com.gorosoft.bookme.now.di

import com.gorosoft.bookme.now.data.database.datasource.ProfileCacheDataSource
import com.gorosoft.bookme.now.data.database.datasource.ProfileCacheDataSourceProtocol
import com.gorosoft.bookme.now.data.network.datasource.BookingRemoteDataSource
import com.gorosoft.bookme.now.data.network.datasource.PlaceRemoteDataSource
import com.gorosoft.bookme.now.data.network.datasource.ProfileRemoteDataSource
import com.gorosoft.bookme.now.data.network.headers_holder.HeadersHolderProtocol
import com.gorosoft.bookme.now.data.network.headers_holder.RuntimeHeadersHolder
import com.gorosoft.bookme.now.data.network.token_holder.TokenHolder
import com.gorosoft.bookme.now.data.network.token_holder.TokenHolderProtocol
import org.koin.dsl.module
import kotlin.math.sin

fun dataSourceModule() = module {
    factory<ProfileCacheDataSourceProtocol> {
        ProfileCacheDataSource(
            profileDao = get(),
        )
    }
    factory<ProfileRemoteDataSource> {
        ProfileRemoteDataSource(
            client = get(),
        )
    }

    factory<BookingRemoteDataSource> {
        BookingRemoteDataSource(
            client = get(),
        )
    }

    factory<PlaceRemoteDataSource> {
        PlaceRemoteDataSource(
            client = get(),
        )
    }

    single<TokenHolderProtocol> { TokenHolder(context = get()) }

    single<HeadersHolderProtocol> { RuntimeHeadersHolder() }
}
