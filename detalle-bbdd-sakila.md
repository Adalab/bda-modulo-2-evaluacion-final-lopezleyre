# Información detallada de cada una de las tablas de la BBDD de Sakila

1. **actor**:
   - **actor_id**: Identificador único del actor.
   - **first_name**: Nombre del actor.
   - **last_name**: Apellido del actor.
   - **last_update**: Fecha y hora de la última actualización de los datos del actor.

2. **address**:
   - **address_id**: Identificador único de la dirección.
   - **address**: La dirección de la tienda de alquiler.
   - **address2**: Campo opcional para información adicional de dirección.
   - **district**: Distrito o área de la dirección.
   - **city_id**: Identificador de la ciudad asociada a la dirección.
   - **postal_code**: Código postal de la dirección.
   - **phone**: Número de teléfono de la dirección.
   - **location**: Datos geoespaciales de la dirección.
   - **last_update**: Fecha y hora de la última actualización de los datos de la dirección.

3. **category**:
   - **category_id**: Identificador único de la categoría.
   - **name**: Nombre de la categoría.
   - **last_update**: Fecha y hora de la última actualización de los datos de la categoría.

4. **city**:
   - **city_id**: Identificador único de la ciudad.
   - **city**: Nombre de la ciudad.
   - **country_id**: Identificador del país al que pertenece la ciudad.
   - **last_update**: Fecha y hora de la última actualización de los datos de la ciudad.

5. **country**:
   - **country_id**: Identificador único del país.
   - **country**: Nombre del país.
   - **last_update**: Fecha y hora de la última actualización de los datos del país.

6. **customer**:
   - **customer_id**: Identificador único del cliente.
   - **store_id**: Identificador de la tienda asociada al cliente.
   - **first_name**: Nombre del cliente.
   - **last_name**: Apellido del cliente.
   - **email**: Dirección de correo electrónico del cliente.
   - **address_id**: Identificador de la dirección del cliente.
   - **active**: Indica si el cliente está activo (1) o inactivo (0).
   - **create_date**: Fecha y hora de creación del registro del cliente.
   - **last_update**: Fecha y hora de la última actualización de los datos del cliente.

7. **film**:
   - **film_id**: Identificador único de la película.
   - **title**: Título de la película.
   - **description**: Descripción de la trama de la película.
   - **release_year**: Año de lanzamiento de la película.
   - **language_id**: Identificador del idioma de la película.
   - **original_language_id**: Identificador del idioma original de la película (si es diferente del idioma principal).
   - **rental_duration**: Duración del alquiler en días.
   - **rental_rate**: Tarifa de alquiler.
   - **length**: Duración en minutos de la película.
   - **replacement_cost**: Costo de reemplazo de la película.
   - **rating**: Clasificación de contenido de la película (por ejemplo, "PG-13").
   - **special_features**: Características especiales de la película.
   - **last_update**: Fecha y hora de la última actualización de los datos de la película.

8. **film_actor**:
   - **actor_id**: Identificador del actor que participa en la película.
   - **film_id**: Identificador de la película en la que el actor participa.
   - **last_update**: Fecha y hora de la última actualización de los datos de relación entre actores y películas.

9. **film_category**:
   - **film_id**: Identificador de la película.
   - **category_id**: Identificador de la categoría de la película.
   - **last_update**: Fecha y hora de la última actualización de los datos de relación entre películas y categorías.

10. **inventory**:
    - **inventory_id**: Identificador único del inventario.
    - **film_id**: Identificador de la película asociada al inventario.
    - **store_id**: Identificador de la tienda donde se encuentra el inventario.
    - **last_update**: Fecha y hora de la última actualización de los datos del inventario.

11. **language**:
    - **language_id**: Identificador único del idioma.
    - **name**: Nombre del idioma.
    - **last_update**: Fecha y hora de la última actualización de los datos del idioma.

12. **payment**:
    - **payment_id**: Identificador único del pago.
    - **customer_id**: Identificador del cliente que realizó el pago.
    - **staff_id**: Identificador del personal que procesó el pago.
    - **rental_id**: Identificador del alquiler asociado al pago.
    - **amount**: Cantidad del pago.
    - **payment_date**: Fecha y hora del pago.

13. **rental**:
    - **rental_id**: Identificador único del alquiler.
    - **rental_date**: Fecha y hora del alquiler.
    - **inventory_id**: Identificador del inventario asociado al alquiler.
    - **customer_id**: Identificador del cliente que realizó el alquiler.
    - **return_date**: Fecha y hora de devolución del alquiler.
    - **staff_id**: Identificador del personal que procesó el alquiler.
    - **last_update**: Fecha y hora de la última actualización de los datos del alquiler.

14. **staff**:
    - **staff_id**: Identificador único del personal.
    - **first_name**: Nombre del personal.
    - **last_name**: Apellido del personal.
    - **address_id**: Identificador de la dirección del personal.
    - **picture**: URL de la imagen del personal.
    - **email**: Dirección de correo electrónico del personal.
    - **store_id**: Identificador de la tienda a la que está asignado el personal.
    - **active**: Indica si el personal está activo (1) o inactivo (0).
    - **username**: Nombre de usuario del personal.
    - **password**: Contraseña del personal.
    - **last_update**: Fecha y hora de la última actualización de los datos del personal.

15. **store**:
    - **store_id**: Identificador único de la tienda.
    - **manager_staff_id**: Identificador del personal que gestiona la tienda.
    - **address_id**: Identificador de la dirección de la tienda.
    - **last_update**: Fecha y hora de la última actualización de los datos de la tienda.
