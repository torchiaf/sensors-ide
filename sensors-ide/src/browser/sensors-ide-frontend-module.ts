/**
 * Generated using theia-extension-generator
 */
import { ContainerModule } from '@theia/core/shared/inversify';
import { SensorsIdeContribution } from './sensors-ide-contribution';


export default new ContainerModule(bind => {

    // Replace this line with the desired binding, e.g. "bind(CommandContribution).to(SensorsIdeContribution)
    bind(SensorsIdeContribution).toSelf();
});
