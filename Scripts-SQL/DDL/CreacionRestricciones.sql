ALTER TABLE
    ONLY urbancity.carrito
ADD
    CONSTRAINT "FK_IDCARRITO_CARRITO" PRIMARY KEY (idcarrito);

--
-- TOC entry 2101 (class 2606 OID 81135)
-- Name: cliente PK_CLIENTE_IDCLIENTE; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.cliente
ADD
    CONSTRAINT "PK_CLIENTE_IDCLIENTE" PRIMARY KEY (idcliente);

--
-- TOC entry 2103 (class 2606 OID 81143)
-- Name: categoria PK_IDCATEGORIA_CATEGORIA; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.categoria
ADD
    CONSTRAINT "PK_IDCATEGORIA_CATEGORIA" PRIMARY KEY (idcategoria);

--
-- TOC entry 2111 (class 2606 OID 81197)
-- Name: pedpro PK_IDPEDIDO-IDREFERENCIA_PEDPRO; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.pedpro
ADD
    CONSTRAINT "PK_IDPEDIDO-IDREFERENCIA_PEDPRO" PRIMARY KEY (idpedido, idreferencia);

--
-- TOC entry 2107 (class 2606 OID 81173)
-- Name: pedido PK_IDPEDIDO_PEDIDO; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.pedido
ADD
    CONSTRAINT "PK_IDPEDIDO_PEDIDO" PRIMARY KEY (idpedido);

--
-- TOC entry 2109 (class 2606 OID 81186)
-- Name: producto PK_IDREFERENCIA_PRODUCTO; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.producto
ADD
    CONSTRAINT "PK_IDREFERENCIA_PRODUCTO" PRIMARY KEY (idreferencia);

--
-- TOC entry 2105 (class 2606 OID 81151)
-- Name: subcategoria PK_IDSUBCATEGORIA_CATEGORIA; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.subcategoria
ADD
    CONSTRAINT "PK_IDSUBCATEGORIA_CATEGORIA" PRIMARY KEY (idsubcategoria);

--
-- TOC entry 2115 (class 2606 OID 81235)
-- Name: guiatalla guiatalla_pkey; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.guiatalla
ADD
    CONSTRAINT guiatalla_pkey PRIMARY KEY (idguia);

--
-- TOC entry 2116 (class 2606 OID 81153)
-- Name: subcategoria FK_CATEGORIA_SUBCATEGORIA; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.subcategoria
ADD
    CONSTRAINT "FK_CATEGORIA_SUBCATEGORIA" FOREIGN KEY (idcategoria) REFERENCES urbancity.categoria(idcategoria) NOT VALID;

--
-- TOC entry 2122 (class 2606 OID 81223)
-- Name: carrito FK_IDCLIENTE_CLIENTE; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.carrito
ADD
    CONSTRAINT "FK_IDCLIENTE_CLIENTE" FOREIGN KEY (idcliente) REFERENCES urbancity.cliente(idcliente);

--
-- TOC entry 2117 (class 2606 OID 81174)
-- Name: pedido FK_IDCLIENTE_PEDIDO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.pedido
ADD
    CONSTRAINT "FK_IDCLIENTE_PEDIDO" FOREIGN KEY (idcliente) REFERENCES urbancity.cliente(idcliente);

--
-- TOC entry 2119 (class 2606 OID 81198)
-- Name: pedpro FK_IDPEDIDO_PEDPRO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.pedpro
ADD
    CONSTRAINT "FK_IDPEDIDO_PEDPRO" FOREIGN KEY (idpedido) REFERENCES urbancity.pedido(idpedido);

--
-- TOC entry 2120 (class 2606 OID 81203)
-- Name: pedpro FK_IDREFERENCIA_PEDPRO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.pedpro
ADD
    CONSTRAINT "FK_IDREFERENCIA_PEDPRO" FOREIGN KEY (idreferencia) REFERENCES urbancity.producto(idreferencia);

--
-- TOC entry 2121 (class 2606 OID 81218)
-- Name: carrito FK_IDREFERENCIA_PRODUCTO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.carrito
ADD
    CONSTRAINT "FK_IDREFERENCIA_PRODUCTO" FOREIGN KEY (idreferencia) REFERENCES urbancity.producto(idreferencia);

--
-- TOC entry 2118 (class 2606 OID 81187)
-- Name: producto FK_IDSUBCATEGORIA_PRODUCTO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.producto
ADD
    CONSTRAINT "FK_IDSUBCATEGORIA_PRODUCTO" FOREIGN KEY (idsubcategoria) REFERENCES urbancity.subcategoria(idsubcategoria);