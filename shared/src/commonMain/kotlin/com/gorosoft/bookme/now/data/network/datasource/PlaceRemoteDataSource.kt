package com.gorosoft.bookme.now.data.network.datasource

import com.gorosoft.bookme.now.ResultWrapper
import com.gorosoft.bookme.now.domain.models.LocationModel
import com.gorosoft.bookme.now.domain.models.PlaceType
import com.gorosoft.bookme.now.safeDataResponseCall
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.request.get
import io.ktor.client.request.parameter
import io.ktor.client.statement.HttpResponse

class PlaceRemoteDataSource(
    private val client: HttpClient,
) {
    // GET: base_url/api/place/list
    suspend fun getPlaces(
        token: String,
        query: String? = null,
        type: PlaceType,
        location: LocationModel,
        radius: Int,
    ): ResultWrapper<Any> {
        val result: HttpResponse = client.get("place/list") {
            // bearerAuth(token)
            parameter("query", query)
            parameter("filter", type)
            parameter("lat", location.latitude)
            parameter("lon", location.longitude)
            parameter("radius", radius)
            parameter("token", token)
        }

        return safeDataResponseCall { result.body() }
    }
}