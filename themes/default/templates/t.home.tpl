{include file='sections/main_header.tpl'}
				<div id="main-wrapper">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-8 col-12-medium">
								<div id="content">
									<!-- Content -->
									    <article>
									{if $tsUser->is_member}
                                         <section>
                                         <div class="complord">
											<div class="create">
												<div class="stado">
													<span>&iquest;Qu&eacute; est&aacute;s pensando&#63;</span>
											    </div>
											    <div class="sartiq">
													<a href="{$tsConfig.url}/agregar/"><span><i class="far fa-pen"></i>  Crear art&iacute;culo</span></a>
											    </div>		
											</div>	
				                         {include file='modules/m.global_shout.tpl'}
			                             </div>
			                             </section>
                                    {/if}
                                         <section>{include file='modules/m.home_last_posts.tpl'}</section>
										</article>

								</div>
							</div>
							<div class="col-4 col-12-medium">
								<div id="sidebar">

									<!-- Sidebar -->
										<section>
                                         {include file='modules/m.home_stats.tpl'}	
										</section>
										<section>
                                         {include file='modules/m.home_shouts.tpl'}
										</section>
										<section>
                                         {include file='modules/m.home_top_posts.tpl'}
										</section>
										<section>
                                         {include file='modules/m.home_noticias.tpl'}
										</section>
										<section>
                                         {include file='modules/m.home_posts_recomendados.tpl'}
										</section>

								</div>
							</div>
						</div>
					</div>
				</div>
{include file='sections/main_footer_v6.tpl'}