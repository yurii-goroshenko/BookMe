package com.gorosoft.bookme.now.entities

import kotlinx.serialization.Serializable

@Serializable
enum class PLACETYPE(val text: String) {
    BARBER("barber"),
    CLINIC("clinic")
}